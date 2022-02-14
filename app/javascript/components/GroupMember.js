import React from 'react';
import styled from "styled-components";
import { Grid, Chip } from "@material-ui/core";

const myFavs = [
  {genre: "映画", title: "スパイダーマン：ノー・ウェイ・ホーム"},
  {genre: "動物", title: "猫を飼いたい。。"},
  {genre: "自然", title: "去年から登山を始めました！"}
]

const MemberCard = styled.div`
  width: 280px;
  border: 1px solid rgba(0, 0, 0, 0.12);
  border-radius: 3px;
  padding: 10px;
  // box-shadow: 1px 0 3px gray;
`

const MemberName = styled.div`
  font-size: 18px;
  padding: 0 10px;
  font-weight: bold;
`;

const MemberStatus = styled.div`
  font-size: 15px;
  padding: 0 10px 10px 10px;
`;
const SmallFrame = styled.div`
  height: 95px;
  padding: 8px;
  margin: 10px;
  background: rgba(0, 0, 0, 0.02);
  // border: 1px solid rgba(0, 0, 0, 0.12);
  border-radius: 3px;
  &:hover {
    box-shadow: 0 0 4px gray;
  }
`

const MemberHeader = (props) => {
  return (
    <div className="member-header">
      <div>
        {/* <img src=""  alt="img" className="image-icon" /> */}
      </div>
      <div>
        <MemberName>{props.user.name}</MemberName>
        <MemberStatus>{props.user.description}</MemberStatus>
      </div>
    </div>
  );
};

const MyFavorite = () => {
  return (
    <div className="my-favorite">
      {myFavs.map((val, key) => {
        return (
          <SmallFrame key={key}>
            <div className="small-header">
              <Chip
                label={val.genre}
                size="small"
                color="primary"
                variant="outlined"
              />
              <div className="new"></div>
            </div>
            <div className="title">{val.title}</div>
          </SmallFrame>
        );
      })}
    </div>
  );
};

function GroupMember(props) {
  return (
    <Grid item sm={6} md={4} lg={3}>
      <MemberCard>
        <MemberHeader user={props.user} />
        <div className="interest">⚫︎ 私の興味・関心</div>
        <MyFavorite />
        <div className="more">もっと見る</div>
      </MemberCard>
    </Grid>
  );
}

export default GroupMember;

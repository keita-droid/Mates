import React, {useState, useEffect} from 'react';
import axios from "axios";
import GroupMember from './GroupMember';
import { Container, Grid } from "@material-ui/core";

function GroupMembers(props) {
  // const [members, setMembers] = useState([]);
  // const num = String(props.selectedGroup.id)

  // useEffect(() => {
  //   axios.get(`/api/v1/groups/${num}.json`)
  //     .then((resp) => {
  //       console.log(resp.data);
  //       setMembers(resp.data);
  //     })
  //     .catch((e) => {
  //       console.log(e);
  //     });
  // }, []);

  return (
    <Container maxWidth="lg">
      {Object.keys(props.selectedGroup).length > 0 ? (
        <div>
          <h1 className="group-header">{props.selectedGroup.name}</h1>
          <Grid container spacing={5}>
            {props.selectedGroup.users.map((user, key) => {
              return <GroupMember key={key} user={user} />;
            })}
          </Grid>
        </div>
      ) : (
        <div>create new group</div>
      )}
    </Container>
  );
}

export default GroupMembers;

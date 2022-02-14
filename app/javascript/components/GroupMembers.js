import React, {useState, useEffect} from 'react';
import axios from "axios";
import { BrowserRouter, Link, Route, Switch } from "react-router-dom";
import GroupMember from './GroupMember';
import { Grid } from "@material-ui/core";

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
    <>
      {Object.keys(props.selectedGroup).length > 0 ? (
        <div>
          <h1 className="group-header">{props.selectedGroup.name}</h1>
          <Grid container spacing={5}>
            {props.selectedGroup.users.map((user, key) => {
              return (
                <GroupMember key={key} user={user} />
              );
            })}
          </Grid>
        </div>
      ) : (
        <div>create new group</div>
      )}
    </>
  );
}

export default GroupMembers;

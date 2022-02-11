import React, {useState, useEffect} from 'react';
import axios from "axios";

function GroupMembers() {
  const [groups, setGroups] = useState([]);

  useEffect(() => {
    axios.get('/api/v1/groups.json')
    .then (resp => {
      console.log(resp.data)
      setGroups(resp.data);
    })
    .catch (e => {
      console.log(e);
    })
  }, [])

  return(
    <>
      {groups.length > 0 ? (
        <div>
          <h1>{groups[0].name}</h1>
          <div>{groups[0].users.map((user, key) => {
            return(<div key={key}>{user.name}</div>)})}
          </div>
        </div>
        ) : (<div>create new group</div>)}
    </>
  );
}

export default GroupMembers;

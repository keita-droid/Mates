import React from 'react';

function GroupMembers() {
  const group = null;

  return(
    <>
      {group ? (<div>group member list</div>) : (<div>create new group</div>)}
    </>
  );
}

export default GroupMembers;

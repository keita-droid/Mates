import React, { useState, useEffect } from "react";
import axios from "axios";
import './App.css';
import GroupMembers from './GroupMembers';

const SideBar = (props) => {
  return (
    <ul className="menu">
      <li>ダッシュボード</li>
      <li>マイアカウント</li>
      <li>
        <a href="/users/sign_out" data-method="delete">サインアウト</a>
      </li>
      <li className="post">投稿する</li>
      <div className="group-list">
        グループ一覧
        <ul>
          {props.groups.map((group, key) => {
            return(
              <li key={key}>{group.name}</li>
            );
          })}
          <li>crazy living</li>
          <li>techcamp梅田校</li>
          <li>三中写真部</li>
        </ul>
      </div>
    </ul>
  );
}

function App() {
    const [groups, setGroups] = useState([]);
    const [selectedGroup, setSelectedGroup] = useState({});

    useEffect(() => {
      axios
        .get("/api/v1/groups.json")
        .then((resp) => {
          console.log(resp.data);
          setGroups(resp.data);
          if (resp.data.length > 0) {
            setSelectedGroup(resp.data[0]);
          }
        })
        .catch((e) => {
          console.log(e);
        });
    }, []);

    const changeGroup = () => {
      // グループ切り替え表示
    }

  return(
    <>
      <header className='header'>Mates</header>
      <div className='main'>
        <SideBar groups={groups} />
        <GroupMembers selectedGroup={selectedGroup}/>
      </div>
      <footer className='footer'></footer>
    </>
  );
}

export default App;

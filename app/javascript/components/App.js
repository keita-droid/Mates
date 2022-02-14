import React, { useState, useEffect } from "react";
import { BrowserRouter, Link, Route, Switch } from 'react-router-dom';
import axios from "axios";
import { Container } from "@material-ui/core";
import './App.css';
import GroupMembers from './GroupMembers';
import User from './User';

const SideBar = (props) => {
  return (
    <ul className="menu">
      <Link to="/">
        <li>ダッシュボード</li>
      </Link>
        <li>マイアカウント</li>
      <li>
        <a href="/users/sign_out" data-method="delete">
          サインアウト
        </a>
      </li>
      <li className="post">投稿する</li>
      <div className="group-list">
        グループ一覧
        <ul>
          {props.groups.map((group, key) => {
            return <li key={key}>{group.name}</li>;
          })}
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

  return (
    <BrowserRouter>
      <header className="header">Mates</header>
      <div className="main">
        <SideBar groups={groups} />
        <Container maxWidth="lg">
          <Switch>
            <Route exact path="/">
              <GroupMembers selectedGroup={selectedGroup} />
            </Route>
          </Switch>
        </Container>
      </div>
      <footer className="footer"></footer>
    </BrowserRouter>
  );
}

export default App;

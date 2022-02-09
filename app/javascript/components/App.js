import React from 'react';
import './App.css';
import GroupMembers from './GroupMembers';

const SideBar = () => {
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
          <li>crazy living</li>
          <li>techcamp梅田校</li>
          <li>三中写真部</li>
        </ul>
      </div>
    </ul>
  );
}

function App() {
  return(
    <>
      <header className='header'>Mates</header>
      <div className='main'>
        <SideBar />
        <GroupMembers />
      </div>
      <footer className='footer'></footer>
    </>
  );
}

export default App;

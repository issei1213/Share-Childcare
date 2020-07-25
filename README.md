## アプリ名
  Share Childcare

## アプリ概要
  育児専用のマッチングアプリケーション

## 制作背景
  スクールのカリキュラム以外で学習した内容を、本アプリ作成時に使用し開発を実施。
  また、育児専用のマッチングアプリとし、今まで作成してきなかったカテゴリのアプリを開発を試みた。

## 実装機能
- ユーザー管理機能(ログイン・ユーザー登録)
  - 新規作成はセッション方式
  - ログインはモーダルで実装
- 依頼機能
  - 非同期通信で詳細表示
- 通知・既読機能
  - 非同期通信とモーダルで実装
- チャット機能
  - 非同期通信・自動通信


## 本番環境（デプロイ先とテストアカウント＆ID）
- GitHub:https://github.com/issei1213/Share-Childcare
- デプロイ先:http://share-childcare.aws-and-infra.online/
- テストアカウント: Email: test@gmail.com / Password: aaaa1111

## DEMO
## トップ画面


![top-before_login](https://user-images.githubusercontent.com/59830008/88449876-9096de00-ce85-11ea-9a7b-0f02e2ddd967.jpg)![top-after_login](https://user-images.githubusercontent.com/59830008/88449897-aefcd980-ce85-11ea-98f6-a37da0953375.jpg)



## 投稿画面


## 編集画面


## ユーザ登録画面 -->


## 工夫したポイント
  - CI/CDツール使用し、自動テスト・デプロイ実施
  - 独自ドメインを取得しRoute53を使用したり、EBSで負荷分散を考慮し開発実施
  - 開発環境にはDockerを利用
  - 積極的にモーダルを使用し、UIを意識した


## 苦労したポイント
  - 通知機能で通知する側と受ける側の実装で、アソシエーションの組み方を理解しておらず、苦労した。結果的に、モデル上にメソッドを作成し実装した。

## 使用技術概要
  - 言語：Haml / SCSS / Ruby / jQuery
  - フレームワーク：Ruby on Rails
  - DB：mysql
  - 開発環境：Docker
  - 本番環境：AWS

<!-- ## 課題や今後実装したい機能
  - 画像投稿機能
  - インクリメンタルサーチのプルダウンで場合分け
  - タグ登録時のplugin機能
  - いいね機能のデザイン変更・非同期通信
  - 投稿時の5W1H入力
  - コメント機能（非同期通信） -->

## 使用技術詳細
![使用技術詳細](https://user-images.githubusercontent.com/59830008/87224046-f6329700-c3bc-11ea-85cf-f89120052812.jpg)
## DB設計(ER図)
![Share Childcare](https://user-images.githubusercontent.com/59830008/87654808-66149900-c792-11ea-96f8-bdc23b0bb6fd.jpg)
## システム構成図
![ShareChildren_システム構成図 (1)](https://user-images.githubusercontent.com/59830008/87224229-91783c00-c3be-11ea-8aed-e5112093fbd5.jpg)




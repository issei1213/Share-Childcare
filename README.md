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
|ログイン前|ログイン後|
|---|---|
|![localhost_3000_](https://user-images.githubusercontent.com/59830008/88450617-326cf980-ce8b-11ea-8719-747b96800b1f.png)|![share-childcare aws-and-infra online_ (1)](https://user-images.githubusercontent.com/59830008/88450444-e9687580-ce89-11ea-8976-5b022e58b188.png)|

## ユーザー新規登録画面(ウィザード形式)
|step1|step2|確認画面|
|---|---|---|
|![localhost_3000_signups_step1 (1)](https://user-images.githubusercontent.com/59830008/88450711-f25a4680-ce8b-11ea-9f63-b47ce5f876ab.png)|![localhost_3000_signups_step2](https://user-images.githubusercontent.com/59830008/88450714-f9815480-ce8b-11ea-9501-e256aea73be5.png)|![localhost_3000_signups_new](https://user-images.githubusercontent.com/59830008/88450717-000fcc00-ce8c-11ea-8b2c-3b9285a1d29b.png)|

## マイメニュー
|お知らせ|依頼リスト|チャットリスト|
|---|---|---|
|![localhost_3000_notifications](https://user-images.githubusercontent.com/59830008/88450833-ef138a80-ce8c-11ea-8304-800191006489.png)|![localhost_3000_orders](https://user-images.githubusercontent.com/59830008/88450841-f89cf280-ce8c-11ea-9172-02caa3ccb55d.png)|![localhost_3000_chatslist](https://user-images.githubusercontent.com/59830008/88450848-00f52d80-ce8d-11ea-9aac-5e9c7847a95b.png)|

## 設定メニュー
|共通情報|保護者情報|ベビーシッター情報|
|---|---|---|
|![localhost_3000_signups_1](https://user-images.githubusercontent.com/59830008/88472591-6f022900-cf4f-11ea-994e-ea40b761fb89.png)|![localhost_3000_parents_2_user_id=1](https://user-images.githubusercontent.com/59830008/88472606-9e189a80-cf4f-11ea-8416-81aa21326a15.png)|![localhost_3000_babysitters_1](https://user-images.githubusercontent.com/59830008/88472633-f6e83300-cf4f-11ea-94d0-0174288c5a7b.png)|

## 依頼画面
|依頼フォーム|依頼詳細|
|---|---|
|![localhost_3000_homes_7_parent_id=2](https://user-images.githubusercontent.com/59830008/88473205-2a2dc080-cf56-11ea-91db-91aa35cb6c03.png)|![localhost_3000_orders (1)](https://user-images.githubusercontent.com/59830008/88473213-387bdc80-cf56-11ea-90d1-d87be2f53bf8.png)|


## チャットルーム
|チャットルーム|
|---|
|![share-childcare aws-and-infra online_orders_1_chats](https://user-images.githubusercontent.com/59830008/88474601-205e8a00-cf63-11ea-8a11-0c7564d6c535.png)|

## 工夫したポイント
  - CI/CDツール使用し、自動テスト・デプロイ実施
  - 独自ドメインを取得しRoute53を使用したり、EBSで負荷分散を考慮し開発実施
  - 開発環境にはDockerを利用
  - 積極的にモーダルを使用し、UIを意識した


## 苦労したポイント
  - 通知機能で通知する側と受ける側の実装で、アソシエーションの組み方を理解しておらず、苦労した。結果的に、モデル上にメソッドを作成し実装した。
   - 開発環境と本番環境の動きが違った時

## 使用技術概要
  - 言語：Haml / SCSS / Ruby / jQuery
  - フレームワーク：Ruby on Rails
  - DB：mysql
  - 開発環境：Docker
  - 本番環境：AWS

## 課題や今後実装したい機能
  - 評価機能
  - 外部APIを使用してログイン機能

## 使用技術詳細
![使用技術詳細](https://user-images.githubusercontent.com/59830008/87224046-f6329700-c3bc-11ea-85cf-f89120052812.jpg)
## DB設計(ER図)
![Share Childcare](https://user-images.githubusercontent.com/59830008/87654808-66149900-c792-11ea-96f8-bdc23b0bb6fd.jpg)
## システム構成図
![ShareChildren_システム構成図 (1)](https://user-images.githubusercontent.com/59830008/87224229-91783c00-c3be-11ea-8aed-e5112093fbd5.jpg)

### 補足
 - ELB：Webサーバーの負荷分散・ヘルチェックを行う
 - RDS：マルチAZの同期レプリケーションを使用



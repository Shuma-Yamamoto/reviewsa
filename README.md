# Reviewsa
## サービス概要
大学受験の参考書について、現役大学生によるレビューを閲覧することができるサイト。

![image](https://user-images.githubusercontent.com/70557787/190352385-d6f72f53-313d-4662-aae2-17113932221a.png)

<br><br>

## 開発の背景
### 現状
参考書のレビューは、Amazonや楽天市場などのECサイトで閲覧することができる。<br>
しかし、それらのレビューを読んでも、レビューを書いた人の「その参考書を使い始めたときの学力（何の模擬試験でどのくらいの偏差値だったか）」や「学習環境（高校の学力、通塾の有無、部活動の忙しさなど）」について書かれている場合はほとんどない。

つまり、一般的なECサイトに掲載されている参考書のレビューでは、その参考書が漠然と「**良いか悪いか**」という情報は得られるものの、「どのくらいの学力の人が使うのに適しているのか」や「受験科目や部活動の忙しさなどが自分と類似している人は、どのような使い方をしていたのか」など、その参考書が「**自分に合っているか**」その参考書を「**自分はどう使うべきか**」についての情報はほとんど得られない。

以上のことから、参考書選びに失敗したり、自分に合った参考書は選べたが上手く使いこなせなかったりといった受験生が一定数存在していると考えている。

### 目指すべき姿
受験生が参考書を選んでそれを使用するにあたり、自身の現状の学力や学習環境を踏まえたうえで、**適切な参考書の選択・使用**ができるようになること。

(単に良い参考書を選びたいだけであれば、現状で十分。ECサイトに掲載されているレビューを読めばよい。今回の場合は、そのうえで自分に合った参考書を**適切に**選び、自分に合った**適切な**使い方ができるようにしたい。)

### 解決策（現状と目指すべき姿の差分をどう解消するか）

受験生が、自分と似たような学力や学習環境の人がどのような参考書を使っていて、その参考書をどのように使っていたか、結果としてどのくらい学力が上がったかなどが分かるような、参考書のレビュー閲覧サービスを開発する。

<br><br>

## 開発方針
受験生が自分に合った参考書を適切に選び、自分に合った適切な使い方ができるようなレビューの項目を洗い出し、それを現役大学生が投稿できる機能と、その投稿を受験生が閲覧できる機能をMVPとして開発する。上記以外の機能は、受験生が参考書を適切に選び適切に使用することに関係があれば最小工数で開発し、関係がなければ開発しない。

## 開発期間

2022/9/2～

- スプリント1：9/3, 4, 5
No.1の開発
- スプリント2：9/6, 7, 8, 10
No.2の開発
- スプリント3：9/11, 12, 13
No.3の開発
- スプリント4：9/15, 16
Herokuデプロイ&CSSの強化
- スプリント5：9/
No.4の開発
- スプリント6：9/
No.5の開発

### ユーザストーリー

![image](https://user-images.githubusercontent.com/70557787/190355968-bb5969de-52e2-40fa-ae65-ad509abacb64.png)

### ER図

![image](https://user-images.githubusercontent.com/70557787/190356412-b501b870-a002-44b5-9132-37e455beee34.png)

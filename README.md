# test_flutter_glowing_polyline

最終更新日：2026-03-30

## 概要

**地図上に描画したルート線の「最後の1本だけ」グロー（発光）明滅アニメーションで強調表示する Flutter サンプルアプリ**です。

`flutter_map` + OpenStreetMap で東京都内のデモルートを表示し、直近に選択したポリラインのみを3層重ね（外側グロー・中間グロー・コア線）の sin 波アニメーションで光らせます。Riverpod（Freezed）でルート選択状態を管理し、明滅の停止・再開・削除・全消去をアプリバーから操作できます。

---

## 主な機能

- **グロー明滅ポリライン**：最後に選択したルートを外側・中間・コアの3層ポリラインで描画し、sin 波で透明度と幅をアニメーション
- **最後の1本だけ光る**：それ以前のルートは通常ポリラインで表示、最新1本だけグロー表示
- **明滅の停止・再開**：AppBar のボタンで `GlowBlink` アニメーションを一時停止・再開
- **ルート追加・削除**：画面下部のボタンでルートを選択追加、AppBar から末尾削除・全消去
- **共有アニメーションコントローラ**：`GlowBlink` を `HomeScreen` で一元管理し、ルート切り替え時にアニメーションをリセット
- **OpenStreetMap 表示**：`flutter_map` + `TileLayer` で地図を表示（初期中心：東京）

---

## 画面構成

```
HomeScreen（ConsumerStatefulWidget）
├── AppBar
│   ├── 明滅停止 / 再開ボタン（GlowBlink.stop / restartFromZero）
│   ├── 最後の線を削除ボタン（RouteLines.removeLast）
│   └── 全消去ボタン（RouteLines.clearActiveRoutes）
└── Stack
    ├── FlutterMap
    │   ├── TileLayer（OpenStreetMap）
    │   ├── PolylineLayer（通常ポリライン：最後以外）
    │   └── GlowingPolylineLayer or PolylineLayer（最後の1本）
    │       └── AnimatedBuilder（GlowBlink アニメーション）
    │           └── PolylineLayer × 3（外側グロー・中間グロー・コア）
    └── ルート選択ボタン群（SingleChildScrollView + Wrap）
```

---

## ファイル構成

```
lib/
├── main.dart                                  # エントリーポイント（ProviderScope）
├── controllers/
│   ├── controllers_mixin.dart                 # 全 Controller への統合アクセス Mixin
│   └── route_line/
│       ├── route_line.dart                    # RouteLines Notifier + RouteLinesState（Freezed）
│       ├── route_line.freezed.dart            # Freezed 生成コード
│       └── route_line.g.dart                  # Riverpod 生成コード
├── extensions/
│   └── extensions.dart                        # Dart 拡張メソッド
├── models/
│   └── route_line_model.dart                  # RouteLineModel（ルート定義データクラス）
└── screens/
    ├── home_screen.dart                        # メイン画面（地図・ルート操作）
    └── parts/
        ├── glow_blink.dart                    # GlowBlink（AnimationController ラッパー）
        └── glowing_polyline_layer.dart        # GlowingPolylineLayer（3層グロー描画 Widget）
```

---

## 主要クラス

### `RouteLineModel`（ルート定義）

| フィールド    | 型              | 説明                       |
|-------------|----------------|---------------------------|
| `id`        | `String`       | ルート識別子               |
| `label`     | `String`       | 表示ラベル                 |
| `points`    | `List<LatLng>` | ルートの座標リスト          |
| `coreColor` | `Color`        | コア線の色（デフォルト：シアン）|
| `glowColor` | `Color`        | グロー光の色               |
| `coreWidth` | `double`       | コア線の太さ               |

### `RouteLinesState`（Riverpod 状態）

| フィールド          | 型                    | 説明                         |
|-------------------|----------------------|------------------------------|
| `availableRoutes` | `List<RouteLineModel>` | 選択可能なルート一覧          |
| `activeRoutes`    | `List<RouteLineModel>` | 現在地図上に表示中のルート一覧 |

### `GlowingPolylineLayer`（グロー描画 Widget）

| パラメータ              | 型            | 説明                                    |
|----------------------|--------------|----------------------------------------|
| `points`             | `List<LatLng>`| ルート座標                              |
| `coreColor`          | `Color`      | コア線の色                              |
| `glowColor`          | `Color`      | グロー光の色                            |
| `coreWidth`          | `double`     | コア線の太さ                            |
| `glowMinWidth`       | `double`     | グロー幅の最小値                        |
| `glowMaxWidth`       | `double`     | グロー幅の最大値                        |
| `maxGlowOpacityOuter`| `double`     | 外側グローの最大透明度                  |
| `maxGlowOpacityMiddle`| `double`    | 中間グローの最大透明度                  |
| `blink`              | `GlowBlink?` | 共有アニメーションコントローラ（省略可）  |

---

## 状態管理

Riverpod（`hooks_riverpod` + `riverpod_annotation`）と Freezed を採用しています。

| Controller     | 役割                                                   |
|---------------|-------------------------------------------------------|
| `RouteLines`  | 選択可能ルート一覧・表示中ルート一覧の管理（追加・削除・全消去）|

`ControllersMixin` を使うと、各画面の `ConsumerState` から Controller に簡潔にアクセスできます。

---

## 依存パッケージ

### dependencies

| パッケージ                  | バージョン   | 用途                              |
|---------------------------|-------------|----------------------------------|
| `flutter_map`             | `^7.0.2`   | 地図表示（OpenStreetMap）          |
| `latlong2`                | `^0.9.1`   | 緯度経度の型・計算                  |
| `flutter_riverpod`        | `^2.5.1`   | 状態管理                           |
| `hooks_riverpod`          | `^2.5.1`   | Riverpod + Hooks                 |
| `riverpod_annotation`     | `^2.3.5`   | Riverpod アノテーション             |
| `freezed_annotation`      | `^2.4.1`   | 不変オブジェクト定義                 |
| `json_annotation`         | `^4.9.0`   | JSON シリアライズ                   |
| `cached_network_image`    | `^3.4.1`   | 画像キャッシュ                      |
| `flutter_cache_manager`   | `^3.4.1`   | ファイルキャッシュ                   |
| `scroll_to_index`         | `^3.0.1`   | 自動スクロール                      |
| `scrollable_positioned_list`| `^0.3.8` | 位置指定スクロール                  |
| `font_awesome_flutter`    | `^10.7.0`  | アイコン                           |
| `http`                    | `^1.2.1`   | HTTP 通信                         |
| `intl`                    | `^0.20.2`  | 国際化・日付フォーマット             |
| `url_launcher`            | `^6.3.2`   | URL 起動                          |
| `equatable`               | `^2.0.7`   | 値オブジェクトの等価比較             |
| `flutter_launcher_icons`  | `^0.13.1`  | アプリアイコン生成                  |
| `flutter_native_splash`   | `^2.4.0`   | スプラッシュ画面                    |

### dev_dependencies

| パッケージ            | バージョン   | 用途                        |
|----------------------|------------|----------------------------|
| `build_runner`       | `^2.4.8`   | コード生成実行               |
| `freezed`            | `^2.4.6`   | Freezed コード生成           |
| `json_serializable`  | `^6.7.1`   | JSON コード生成              |
| `riverpod_generator` | `^2.4.0`   | Riverpod コード生成          |
| `riverpod_lint`      | `^2.3.10`  | Riverpod Lint ルール         |
| `custom_lint`        | `^0.6.4`   | カスタム Lint                |

---

## 環境

| 項目       | バージョン  |
|-----------|-----------|
| Dart SDK  | `^3.8.1`  |

---

## セットアップ

```bash
# リポジトリのクローン
git clone https://github.com/toyotarou/test_flutter_glowing_polyline.git
cd test_flutter_glowing_polyline

# パッケージの取得
flutter pub get

# コード生成（freezed / riverpod_generator）
dart run build_runner build --delete-conflicting-outputs

# アプリの実行
flutter run
```

---

## 対応プラットフォーム

- Android
- iOS
- Web
- macOS
- Linux
- Windows

# シークレット管理

[1 Password CLI](https://developer.1password.com/docs/cli) を使って機密情報を管理する.

- chezmoi: シークレット (SSH キー、トークンなど) を管理
- 1Password: シークレットの安全な保管場所

## 1 Paasword CLI の設定

1 Password アプリを開き、設定 → 開発者 →「1Password CLI と連携」にチェック

```bash
op valut list
```

## シークレットの追加

1. 1passwordにアイテムを追加 (Private Valut)
2. テンプレートファイルを作成
    - 例: dot_config/zsh/private_env.zsh.tmpl
3. 適用: `make secrets-apply`

#### 例. SSHキーを1passwordに登録

```bash
op item create \
  --category=Login \
  --title="GitHub SSH" \
  --vault="Private" \
  "private_key[password]=$(cat ~/.ssh/id_ed25519.github)" \
  "public_key[text]=$(cat ~/.ssh/id_ed25519.github.pub)"
```

# Docker Multi-Language Dev Environment (`Docker19env`)

A lightweight Docker image that bundles the **most common programming languages and build tools** in a single Ubuntu-based container.  
Spin it up once, code in any language you like (Python → Erlang), and keep your host machine totally clean.

---

## ✨ Key Features

| Language / Tool | Version source | Installed via |
|-----------------|---------------|---------------|
| **Python 3** (`python`, `pip`) | Ubuntu repos | `apt-get` |
| **Node.js & npm** | Ubuntu repos | `apt-get` |
| **Java (JDK)** | Ubuntu repos | `apt-get` |
| **Go 1.17.6** | Official tarball | `wget` / manual |
| **Rust** | `rustup.rs` | `curl` install script |
| **PHP** | Ubuntu repos | `apt-get` |
| **TypeScript (tsc)** | `npm` global | `npm install -g` |
| **Kotlin** | Ubuntu repos | `apt-get` |
| **Scala** | Ubuntu repos | `apt-get` |
| **Swift** | Ubuntu repos | `apt-get` |
| **Ruby** | Ubuntu repos | `apt-get` |
| **Elixir** | Ubuntu repos | `apt-get` |
| **Dart** | Google APT repo | `apt-get` |
| **Erlang** | Ubuntu repos | `apt-get` |

> The Dockerfile (see [`dockerfile`](dockerfile)) shows the exact commands and install flags. :contentReference[oaicite:0]{index=0}

---

## 🚀 Quick Start

1. **Prerequisites**

   * Docker **19.x** or newer (any recent Docker Desktop or Docker Engine will do).

2. **Clone & Build**

   ```bash
   git clone https://github.com/XMZhangAI/Docker19env.git
   cd Docker19env
   docker build -t multi-lang-env .

3. **Run an interactive container**

   ```bash
   docker run -it --rm -v $PWD:/workspace multi-lang-env
   # You will land in /workspace inside the container
   ```

4. **Hello World in multiple languages**

   ```bash
   python -c "print('hello from Python')"
   node -e "console.log('hello from Node')"
   go run <your.go>
   rustc <your.rs> && ./<your>
   scala -e "println(\"hello from Scala\")"
   # ...and so on
   ```

---

## 🛠 Project Layout

```
Docker19env/
├── dockerfile      # All installation steps live here
└── README.md       # ← you are here
```

> If you prefer `Dockerfile` with a capital “D”, rename the file and adjust the build command—Docker is case-insensitive on most platforms but best practice is `Dockerfile`.

---

## ⚙️ Customisation Tips

* **Trim unused languages**
  Comment out the corresponding install block(s) in the Dockerfile to make the image smaller.

* **Add editor / IDE server**
  Uncomment `apt-get install vim` (already included) or layer in `code-server`, `neovim`, etc.

* **Persistent toolchains**
  Mount a host volume (e.g., `-v ~/.cargo:/root/.cargo`) to keep Rust crates between container sessions.

---

## 🐞 Troubleshooting

| Symptom                              | Likely Cause & Fix                                                                                      |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| `command not found` for a language   | That block was removed or the install failed—rebuild with `docker build --no-cache` and watch the logs. |
| Slow build time                      | Comment out languages you don’t need; Docker layer caching helps on subsequent builds.                  |
| Permission issues on mounted volumes | Add `--user $(id -u):$(id -g)` or adjust folder permissions inside the container.                       |

---

## 📄 License

This repo is released under the **MIT License** (see `LICENSE`). If no license is present yet, open a PR with your preferred license text.

---

## 🙋 Author & Acknowledgements

Created by [Xuanming Zhang](https://web.stanford.edu/~zhangxm).
Feel free to open issues or PRs to add more languages, upgrade versions, or improve install steps.

Happy coding!

# 🚀 Panduan Deployment Chatbot WhatsApp Protokol ke Server Ubuntu (Tanpa Domain / Direct IP)

Panduan ini berisi langkah-langkah lengkap untuk memasang dan menjalankan sistem **Chatbot WhatsApp Administrasi Protokol Kemnaker** di VPS / Server Ubuntu (versi 20.04, 22.04, atau 24.04 LTS) menggunakan IP langsung dan manajemen proses **PM2** agar bot aktif 24/7.

---

## 📋 Daftar Isi
1. [Prasyarat Server](#1-prasyarat-server)
2. [Konfigurasi Firewall (UFW) & Port](#2-konfigurasi-firewall-ufw--port)
3. [Instalasi Runtime & Tools (Node.js 20 LTS, Git, PM2)](#3-instalasi-runtime--tools)
4. [Clone Project & Instalasi Dependensi](#4-clone-project--instalasi-dependensi)
5. [Konfigurasi Environment (.env)](#5-konfigurasi-environment-env)
6. [Inisialisasi Database & Prisma ORM](#6-inisialisasi-database--prisma-orm)
7. [Scan QR WhatsApp Pertama Kali](#7-scan-qr-whatsapp-pertama-kali)
8. [Setup PM2 (Daemon 24/7 & Auto-Restart)](#8-setup-pm2-daemon-247--auto-restart)
9. [Akses Prisma Studio via IP Server (Opsional)](#9-akses-prisma-studio-via-ip-server-opsional)
10. [Perintah Manajemen & Pemeliharaan](#10-perintah-manajemen--pemeliharaan)

---

## 1. Prasyarat Server

- **OS**: Ubuntu 20.04 / 22.04 / 24.04 LTS
- **RAM**: Minimal 1 GB (Direkomendasikan 2 GB)
- **Disk**: Minimal 10 GB SSD
- **Akses**: User dengan hak akses `sudo` / `root`
- **Koneksi Internet**: Server dapat mengakses outbound HTTPS (port 443) dan port WhatsApp (port 5222).

---

## 2. Konfigurasi Firewall (UFW) & Port

Bot WhatsApp berbasis library **Baileys Multi-Device** berkomunikasi langsung ke server WhatsApp melalui koneksi *outbound WebSocket* (`wss://web.whatsapp.com` pada port 443/5222), sehingga **tidak membutuhkan domain atau port webhook inbound khusus**.

Namun, Anda perlu mengatur firewall `ufw` pada Ubuntu untuk mengamankan port SSH dan port layanan lainnya:

```bash
# 1. Pastikan port SSH diizinkan agar remote akses tidak terputus
sudo ufw allow 22/tcp

# 2. (Opsional) Jika Anda ingin mengakses Prisma Studio dari luar via IP:Port 5555
sudo ufw allow 5555/tcp

# 3. (Opsional) Jika database PostgreSQL lokal dibuka untuk koneksi luar
# sudo ufw allow 5432/tcp

# 4. Aktifkan Firewall UFW
sudo ufw enable

# 5. Cek status firewall
sudo ufw status verbose
```

---

## 3. Instalasi Runtime & Tools

Jalankan perintah berikut di server Ubuntu untuk menginstal **Git**, **Node.js 20 LTS**, dan **PM2**:

```bash
# 1. Update repository paket Ubuntu
sudo apt update && sudo apt upgrade -y

# 2. Install dependensi dasar
sudo apt install -y curl git build-essential

# 3. Tambahkan repository NodeSource Node.js 20 LTS
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# 4. Install Node.js & NPM
sudo apt install -y nodejs

# 5. Verifikasi instalasi Node.js dan NPM
node -v    # Output minimal v20.x.x
npm -v

# 6. Install PM2 (Process Manager) secara global
sudo npm install -g pm2
```

---

## 4. Clone Project & Instalasi Dependensi

```bash
# 1. Buat direktori aplikasi di home user
mkdir -p ~/apps
cd ~/apps

# 2. Clone repository project
git clone <URL_GIT_REPOSITORY_ANDA> chatbot-protokol-whatsapp
cd chatbot-protokol-whatsapp

# 3. Install seluruh library dependensi
npm install
```

---

## 5. Konfigurasi Environment (`.env`)

Salin file `.env.example` menjadi `.env`, kemudian sesuaikan konfigurasinya:

```bash
cp .env.example .env
nano .env
```

### Contoh Konfigurasi `.env` di Server:

```env
# ==============================================================================
# Database Configuration (PostgreSQL)
# ==============================================================================
# Jika PostgreSQL berada di server yang sama (Direct):
SSH_ENABLED="false"
DB_HOST="127.0.0.1"
DB_PORT="5432"
DB_USER="postgres_user"
DB_PASSWORD="your_secure_password"
DB_NAME="db_protokol"
DB_SCHEMA="public"

DATABASE_URL="postgresql://postgres_user:your_secure_password@127.0.0.1:5432/db_protokol?schema=public&sslmode=prefer"
DIRECT_URL="postgresql://postgres_user:your_secure_password@127.0.0.1:5432/db_protokol?schema=public&sslmode=prefer"

# (Catatan: Jika database berada di server lain via SSH Bastion, set SSH_ENABLED="true" dan isi SSH_HOST, SSH_USER, dll)

# ==============================================================================
# AI Engine & Intent Recognition
# ==============================================================================
# OpenRouter API Key untuk pemahaman percakapan & NLU
CHAT_API_KEY="sk-or-v1-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
CHAT_MODEL="openrouter/free"

# Google Gemini API Key untuk ekstraksi dokumen PDF
PDF_EXTRACTION_PROVIDER="gemini"
PDF_EXTRACTION_API_KEY="AIzaSyxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
PDF_EXTRACTION_MODEL="gemini-2.5-flash"

ADMIN_CONTACT="0812-3456-7890 (Admin Tim IT Protokol)"

# ==============================================================================
# Cloudinary Storage (File PDF Surat Masuk)
# ==============================================================================
STORAGE_DRIVER="cloudinary"
CLOUDINARY_CLOUD_NAME="your_cloud_name"
CLOUDINARY_API_KEY="your_api_key"
CLOUDINARY_API_SECRET="your_api_secret"
CLOUDINARY_FOLDER="letters"

# ==============================================================================
# Storage Paths & File URL
# ==============================================================================
TEMP_STORAGE_PATH="./storage/temp"
PRIVATE_STORAGE_PATH="./storage/private"
FILE_URL="https://pwa-protokol.gatsu51.com/files/letter/"
```

> **Simpan di nano**: Tekan `Ctrl + O`, lalu `Enter`, kemudian keluar dengan `Ctrl + X`.

---

## 6. Inisialisasi Database & Prisma ORM

Jalankan perintah ini untuk melakukan kompilasi Prisma Client dan sinkronisasi struktur tabel. Anda dapat memilih salah satu metode di bawah ini:

### Opsi A: Menggunakan Prisma Migrate (Direkomendasikan untuk Production)
Jika Anda menggunakan file history migrasi SQL:

```bash
# 1. Generate Prisma Client
npm run db:generate

# 2. Jalankan migrasi di server production
npm run db:migrate:deploy
# Atau jika di local/development ingin membuat file migrasi baru:
# npm run db:migrate
```

### Opsi B: Menggunakan Prisma DB Push (Skema Langsung)
Jika database PostgreSQL sudah ada atau Anda ingin menyinkronkan skema langsung tanpa membuat file history migrasi:

```bash
# 1. Generate Prisma Client
npm run db:generate

# 2. Sinkronkan skema langsung ke PostgreSQL
npm run db:push

# 3. (Opsional - Jika database baru) Jalankan seeder data awal
# npm run db:seed
```

---

## 7. Scan QR WhatsApp Pertama Kali

Sebelum menjalankan secara otomatis di background, jalankan aplikasi secara interaktif sekali untuk memindai QR Code login WhatsApp:

```bash
npm start
```

1. Terminal akan menampilkan **QR Code**.
2. Buka aplikasi WhatsApp di HP Anda.
3. Masuk ke **Menu (Titik 3)** > **Perangkat Tertaut (Linked Devices)** > **Tautkan Perangkat**.
4. Arahkan kamera HP untuk memindai QR Code di terminal server.
5. Tunggu hingga muncul pesan berhasil:
   ```
   ✅ [WhatsApp] Terhubung ke server WhatsApp Multi-Device!
   ```
6. Sesi autentikasi telah tersimpan secara permanen di direktori `./storage/auth_info_baileys/`.
7. Tekan `Ctrl + C` untuk keluar dari terminal.

---

## 8. Setup PM2 (Daemon 24/7 & Auto-Restart)

### 1. Buat File Konfigurasi PM2 (`ecosystem.config.js`)

```bash
nano ecosystem.config.js
```

Tempelkan isi berikut:

```javascript
module.exports = {
  apps: [
    {
      name: 'chatbot-protokol-wa',
      script: 'node_modules/.bin/tsx',
      args: 'src/index.ts',
      cwd: './',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '1G',
      env: {
        NODE_ENV: 'production',
      },
      error_file: './storage/logs/err.log',
      out_file: './storage/logs/out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
    },
  ],
};
```

### 2. Siapkan Folder Log & Jalankan PM2

```bash
# Buat folder log
mkdir -p storage/logs

# Jalankan aplikasi dengan PM2
pm2 start ecosystem.config.js

# Simpan daftar proses agar diingat PM2
pm2 save

# Aktifkan startup service (agar otomatis jalan saat server reboot)
pm2 startup
```
*(Setelah menjalankan `pm2 startup`, salin baris perintah `sudo env PATH=...` yang ditampilkan di layar lalu eksekusi).*

---

## 9. Akses Prisma Studio via IP Server (Opsional)

Jika Anda ingin melihat atau mengedit data database secara visual melalui browser menggunakan **IP Server**:

1. Pastikan port `5555` sudah diizinkan di firewall:
   ```bash
   sudo ufw allow 5555/tcp
   ```
2. Jalankan Prisma Studio di background via PM2:
   ```bash
   pm2 start "npx prisma studio --port 5555 --hostname 0.0.0.0" --name "prisma-studio"
   pm2 save
   ```
3. Buka browser di laptop Anda dan akses:
   ```
   http://IP_SERVER_UBUNTU:5555
   ```

---

## 10. Perintah Manajemen & Pemeliharaan

### Status & Log Bot:
```bash
# Melihat status bot
pm2 status

# Melihat log pesan & aktivitas secara real-time
pm2 logs chatbot-protokol-wa

# Melihat 100 baris log terakhir
pm2 logs chatbot-protokol-wa --lines 100
```

### Restart / Stop:
```bash
# Restart bot
pm2 restart chatbot-protokol-wa

# Stop bot
pm2 stop chatbot-protokol-wa
```

### Cara Update Kode Aplikasi (Jika Ada Pembaruan dari Git):
```bash
cd ~/apps/chatbot-protokol-whatsapp

# Ambil pembaruan kode
git pull

# Install paket baru jika ada perubahan package.json
npm install

# Update Prisma Client
npm run db:generate

# Restart proses bot
pm2 restart chatbot-protokol-wa
```

---

## 🔒 Tips Keamanan
1. **Jangan commit folder `.env` dan `storage/auth_info_baileys/` ke Git**. Folder ini berisi API key dan sesi login WhatsApp yang bersifat rahasia.
2. Gunakan firewall `ufw` dan hanya buka port yang benar-benar dibutuhkan (SSH port 22).
3. Buat backup berkala untuk folder `storage/auth_info_baileys/` agar tidak perlu scan ulang QR jika server dipindahkan.

# Linux Log Analyzer

A lightweight **Bash-based log analyzer** for Linux systems.  
Scans system logs (e.g., `/var/log/auth.log`) for suspicious activity, failed SSH login attempts, and generates useful reports.  
Can be automated using `cron` for daily monitoring.

---

## 🚀 Features
- Detects suspicious **SSH login attempts**  
- Summarizes **system log activity**  
- Stores detailed reports inside the `logs/` directory  
- Fully **automated** with `cron`  

---

## 📂 Project Structure
linux-log-analyzer/
├── scripts/
│   └── log_analyzer.sh   # Main script
├── logs/                 # Log output (gitignored)
├── README.md             # Documentation
└── .gitignore            # Ignore logs & temp files---

## ⚡ Usage

### Run manually
```bash
bash scripts/log_analyzer.sh

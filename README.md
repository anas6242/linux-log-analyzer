# Linux Log Analyzer

A lightweight Bash-based tool that analyzes Linux logs (e.g., failed SSH login attempts), generates reports, and can be scheduled with cron for automation.

## Features
- Detects suspicious SSH login attempts
- Summarizes log activity
- Stores reports in `logs/` directory
- Cron-friendly automation

## Usage
```bash
bash scripts/log_analyzer.sh

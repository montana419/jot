# Atlas 📝

Atlas is an AI-powered journal built with Python and FastAPI. It integrates autonomous agent execution tools, web frameworks, and automated deployment capabilities with database persistence.

---

## 🛠️ Features

* **FastAPI Backend:** Lightweight, high-performance REST endpoints for application logic and visualizer states.

* **Database Integration:** Direct database handling (`database.py`) compatible with managed PostgreSQL .
* **CLI Interface:** Built-in command line interface parser (`cli.py`, `cli_parser.py`, `atlas_cli.py`).
.

---

## 🚀 Getting Started

### 1. Prerequisites

* **Python 3.10+** installed on your system.
* **Git** configured.
* A running **PostgreSQL** .

### 2. Installation

Clone the repository and set up a Python virtual environment:

```bash
# Clone repository
git clone [https://github.com/montana419/jot.git](https://github.com/montana419/jot.git)
cd jot

# Create virtual environment
python -m venv venv

# Activate virtual environment
# Windows (PowerShell):
.\venv\Scripts\Activate.ps1
# Mac/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
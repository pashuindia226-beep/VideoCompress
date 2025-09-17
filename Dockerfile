# Use official python base
FROM python:3.11-slim

# Set workdir
WORKDIR /app

# Install ffmpeg + system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    build-essential \
    python3-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libssl-dev \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run the bot
CMD ["bash", "start.sh"]

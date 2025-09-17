# Base image (already has ffmpeg + python)
FROM artemisfowl004/vid-compress

# Set working directory
WORKDIR /app

# Install system dependencies (needed for pip packages)
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    python3-pip \
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

# Copy requirements first
COPY requirements.txt .

# Upgrade pip + install dependencies
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy rest of the project
COPY . .

# Run the bot
CMD ["bash", "start.sh"]

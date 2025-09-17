FROM artemisfowl004/vid-compress
WORKDIR /app

COPY requirements.txt .

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash","start.sh"]

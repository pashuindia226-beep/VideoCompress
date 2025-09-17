FROM artemisfowl004/vid-compress
WORKDIR /app

COPY requirements.txt .

RUN apt-get update && apt-get install -y \
  build-essential \
  python3-dev \
  default-libmysqlclient-dev \
  libpq-dev \
  libjpeg-dev \
  zlib1g-dev \
  libxml2-dev \
  libxslt1-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash","start.sh"]

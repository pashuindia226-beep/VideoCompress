FROM artemisfowl004/vid-compress
WORKDIR /app

COPY requirements.txt .

# pip upgrade
RUN pip3 install --upgrade pip setuptools wheel

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash","start.sh"]

#!/bin/bash
echo "Установка rutoen..."
wget -O /tmp/rutoen https://github.com/Facts566/RuToEn/releases/download/v1.0/rutoen
sudo cp /tmp/rutoen /usr/local/bin/
sudo chmod +x /usr/local/bin/rutoen
echo "Установка прошла успешно!"
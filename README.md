# hramework
REST API server with Hack


hramework 프로젝트 기본 구조 세팅 (디렉토리/네임스페이스/autoload.json)

가장 기초적인 라우터부터 구현 (URI 매핑 → 함수 실행)

Request / Response 추상화

Attribute 기반으로 route 지정 (<<Get('/')>> 등)

Middleware 기능

DI Container (선택)





# Install in WSL

```
sudo apt update
sudo apt install -y software-properties-common gnupg curl

curl -sSL https://dl.hhvm.com/conf/hhvm.gpg.key | sudo tee /usr/share/keyrings/hhvm.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/hhvm.gpg] https://dl.hhvm.com/ubuntu $(lsb_release -sc) main" \
  | sudo tee /etc/apt/sources.list.d/hhvm.list

sudo apt update
sudo apt install -y hhvm

hhvm --version

```


# Install autoloading

```
// create a hh-autoload.json
{
  "roots": [
    "src/"
  ],
  "devRoots": [
    "tests/"
  ],
  "devFailureHandler": "Facebook\\AutoloadMap\\HHClientFallbackHandler"
}

// run
php /usr/local/bin/composer require hhvm/hhvm-autoload


// install
composer require hhvm/hsl
```





# run
```
cd /mnt/d/Proj/hramework

//run whenever there's new class
./vendor/bin/hh-autoload

//run command for testing
hhvm hramework.hack runserver
```



# Test
```
cd test
../vendor/bin/hh-autoload

```



```
hhvm -m server -p 8000 -d hhvm.server.source_root=/mnt/d/Proj/hramework/src/test/ -d hhvm.server.default_document=main.hack &
```
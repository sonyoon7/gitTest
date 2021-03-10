#사용할 이미지
FROM node:12-alpine

MAINTAINER Eunice Son <eunice.son@companywe.co.kr>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app


#내려받은 이미지에 설치할 패키지 또는 shell 명령어 입력
#예) mkdir ./newdirectory
#RUN npm install -g typescript:[version]
#RUN ["npm", "install", "-g", "typescript:[version]"]
RUN npm install -g pm2
RUN npm install

COPY . /usr/src/app



#WORKDIR 명령어는 cd의 명령어와 비슷합니다. RUN과 CMD과 같은 명령어가 실행될 이미지 내부에 위치를 지정해주는 명령어입니다
#WORKDIR

#로컬파일을 컨테이너로 복사
#ADD 명령어는 빌드 중 호스트의 디렉토리에서 파일을 가져와서 이미지에 파일을 더하는 것입니다. 주의할점은 빌드되는 디렉토리 밖에 위치하는 파일들은 가져오지 않습니다.
#ADD 호스트파일위치 이미지파일위치
#ADD

#COPY
#COPY 명령어는 ADD와 동일한 동작을 합니다. 하지만 압축파일을 자동으로 풀어주지 않습니다.

#RUN npm install

#ENV NODE_ENV development

#VOLUME
#VOLUME 명령어는 호스트의 디렉토리를 docker 컨테이너에 연결하는 명령어입니다. 여러가지 설정파일, 데이터 등을 docker 컨테이너에너 사용할 수 있게 해줍니다.
#즉 디렉토리 내용을 컨테이너에 저장하지 않고 호스트에 저장하도록 설정하는 것입니다. 로그 수집과 같은 데이터 저장에 쓰임. VOLUME 호스트디렉토리 컨테이너디렉토리


#EXPOSE 명령어는 실행한 container외부에 노출할 포트를 지정하는 명령어입니다. 하지만 container를 실행할때 -p 옵션을통해 연결해주어야한다.
#EXPOSE 8080
#ENTRYPOINT 명령어는 컨테이너를 실행했을때 실행할 명령입니다. 컨테이너를 정지했다가 다시 시작해도 실행하는 명령어입니다. 물론 run명령어로 컨테이너를 실행했을때도 실행됩니다.
#컨테이너가 실행될떄 실행되는 명령어이므로 도커파일에서 한번만 사용할 수 있습니다.
#ENTRYPOINT ["npm", "run", "serve"]

CMD ["pm2-runtime", "start", "ecosystem.config.js", "--env", "production"]

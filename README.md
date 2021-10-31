docker, docker-compose 필요함

docker-compose up -d 실행하면 postgres 컨테이너 생성됨

.env 파일에서 db 정보 변경 가능함

script 는 테이블이랑 임시 데이터들이 들어가있음

- ./scripts/table.sql:/docker-entrypoint-initdb.d/1.sql
- ./scripts/schema.sql:/docker-entrypoint-initdb.d/2.sql

docker-entrypoint-initdb.d 의 1.sql \ 2.sql 로 된 이유는
파일 이름 내림차순으로 실행하기 때문임


docker exec -it db_postgres psql -Uusername db -W

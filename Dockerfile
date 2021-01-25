FROM mariadb:10

WORKDIR /build

RUN apt-get update && \
	apt-get install -y \
        git \
        gcc \
        libmariadbd-dev \
        && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/mysqludf/lib_mysqludf_sys.git && \
    cd lib_mysqludf_sys && \
    gcc -Wall \
		-I/usr/include/mariadb/server \
		-I/usr/include/mariadb \
		-I/usr/include/mariadb/server/private \
		-I. -shared lib_mysqludf_sys.c -o lib_mariaudf_sys.so

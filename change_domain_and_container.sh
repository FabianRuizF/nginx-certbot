POSITIONAL=()
while [[ $# -gt 0 ]]
    do
        key="$1"
        case $key in
            -p|--docker_port)
                DOCKER_CONTAINER_PORT="$2"
                shift
                shift
                ;;
            -n|--docker_container_name)
                DOCKER_CONTAINER_NAME="$2"
                shift
                shift
                ;;
            -d|--domain_name)
                DOMAIN_NAME="$2"
                shift
                shift
                ;;

        esac
    done







new_domain=$DOMAIN_NAME
ip=$(curl https://ipinfo.io/ip)
sed -i "s/example.org/$new_domain/g" init-letsencrypt.sh
sed -i "s/example.org/$new_domain/g" data/nginx/app.conf
sed -i "s/X.X.X.X/$ip/g" data/nginx/app.conf
sed -i "s/YYYY/$DOCKER_CONTAINER_PORT/g" data/nginx/app.conf
sed -i "s/example_container_name/$DOCKER_CONTAINER_NAME/g" data/nginx/app.conf


echo $ip:$DOCKER_PORT
echo $DOCKER_CONTAINER_NAME
echo $DOMAIN_NAME



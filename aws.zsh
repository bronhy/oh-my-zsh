# start session
ss() {
    eval "aws ssm start-session --profile $1 --target $2"
}

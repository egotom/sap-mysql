export function Logger(req, res, next){
    console.log('--------------------------')
    console.log(req.ips)
    console.log(req.cookies)
    console.log(req.originalUrl)
    console.log(req.get('User-Agent'))
    console.log(req.params)
    console.log(req.query)
    console.log('--------------------------')
    next()
}
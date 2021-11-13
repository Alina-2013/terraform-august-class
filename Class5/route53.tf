resource "aws_route53_record" "blog" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "blog"
  type    = "CNAME"
  ttl     = "5"

  set_identifier = "blog"
  records        = [module.elb_http.elb_dns_name]
}
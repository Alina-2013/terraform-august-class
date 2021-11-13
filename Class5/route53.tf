resource "aws_route53_record" "blog" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "blog"
  type    = "CNAME"
  ttl     = "5"

  set_identifier = "blog"
  records        = [module.elb_http.elb_dns_name]
}

resource "aws_route53_record" "reader1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "reader1"
  type    = "CNAME"
  ttl     = "5"

  set_identifier = "reader1"
  records        = [module.cluster.cluster_reader_endpoint]
}


resource "aws_route53_record" "writer" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "writer"
  type    = "CNAME"
  ttl     = "5"

  set_identifier = "writer"
  records        = [module.cluster.cluster_endpoint]
}
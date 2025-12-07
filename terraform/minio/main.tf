terraform {
  required_version = ">= 1.13.4"
  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = ">= 3.11.3"
    }
  }
}

resource "minio_s3_bucket" "honyabookstore" {
  acl    = "public"
  bucket = "honyabookstore"
}

resource "minio_ilm_policy" "honyabookstore_policy" {
  bucket = minio_s3_bucket.honyabookstore.bucket

  rule {
    id         = "expire-temp-media-images"
    status     = "Enabled"
    filter     = "media/temp/"
    expiration = "1d"
  }
}

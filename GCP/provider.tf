provider "google" {
  project     = google_project.testproject.id
  region      = "us-central1"
}
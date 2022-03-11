package fr.esgi.hackaton.bucket;

public enum BucketName {
    COMMENT_FILE("bucket-sav-reddit");

    private final String bucketName;

     BucketName(String bucketName) {
        this.bucketName = bucketName;
    }

    public String getBucketName() {
        return bucketName;
    }
}

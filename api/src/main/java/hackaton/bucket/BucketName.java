package hackaton.bucket;

public enum BucketName {
    COMMENT_FILE("my-platform-files-upload");

    private final String bucketName;

     BucketName(String bucketName) {
        this.bucketName = bucketName;
    }

    public String getBucketName() {
        return bucketName;
    }
}

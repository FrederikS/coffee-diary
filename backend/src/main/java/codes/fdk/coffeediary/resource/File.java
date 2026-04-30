package codes.fdk.coffeediary.resource;

public class File {

    private String uri;
    private String mash;

    public File() {
    }

    public File(String uri, String mash) {
        this.uri = uri;
        this.mash = mash;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getMash() {
        return mash;
    }

    public void setMash(String mash) {
        this.mash = mash;
    }
}

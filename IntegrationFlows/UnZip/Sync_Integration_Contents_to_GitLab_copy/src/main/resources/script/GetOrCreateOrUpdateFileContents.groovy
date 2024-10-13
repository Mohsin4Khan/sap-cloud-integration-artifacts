/*
Refer the link below to learn more about how to Create or update file contents in GitHub.
https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#create-or-update-file-contents
*/
import com.sap.gateway.ip.core.customdev.util.Message
import groovy.json.JsonOutput

def Message createFileContents(Message message) {
    //Headers
    def map = message.getHeaders()
    //Properties
    def prop = message.getProperties()
    def token = prop.get("GITLAB_ACCESS_TOKEN").toString()
    // def authorization = "Bearer $token"

    message.setHeader("Content-Type", "application/json")
    // message.setHeader("Accept", "application/vnd.github+json")
    // message.setHeader("Authorization", authorization)
    message.setHeader("PRIVATE-TOKEN", token)

    //Body parameters
    def body = message.getBody(String)
    def base64Content = body.replaceAll("\\r|\\n", "")

    def msg = prop.get("GITLAB_COMMIT_MESSAGE").toString()
    def version = prop.get("Version").toString()
    def commitMessage = msg + " - Version $version"

    def jsonOutput = JsonOutput.toJson([
            "branch": "main",
            "encoding": "base64",
            commit_message: commitMessage,
            content: base64Content
    ])
    
    def folderName      = prop.get("GITLAB_FOLDER");
    def id              = prop.get("Id");
    def fileName        = map.get("CamelFileNameOnly");
    def UnZip           = prop.get("UNZIP");
    def Zip             = prop.get("ZIP");   
    
    if (UnZip == 'YES') {
        def value4UnZip                 = folderName + "/UnZip/" + id + "/" + fileName;
        String encodedUrlForUnZip       = URLEncoder.encode(value4UnZip, "UTF-8");
        String encodedUrlForUnZipV2     = URLEncoder.encode(encodedUrlForUnZip, "UTF-8");
        message.setProperty("encodedUrlPath", encodedUrlForUnZip)
    }
    else if(Zip == 'YES') {
        def value4Zip               = folderName + "/Zip/" + id;
        String encodedUrlForZip     = URLEncoder.encode(value4Zip, "UTF-8");
        String encodedUrlForZipV2   = URLEncoder.encode(encodedUrlForZip, "UTF-8");
        message.setProperty("encodedUrlPath", encodedUrlForZip)
    }

    println JsonOutput.prettyPrint(jsonOutput)
    message.setBody(JsonOutput.prettyPrint(jsonOutput))
    return message
}

def Message updateFileContents(Message message) {
    //Headers
    def map = message.getHeaders()
    //Properties
    def prop = message.getProperties()
    def token = prop.get("GITLAB_ACCESS_TOKEN").toString()
    // def authorization = "Bearer $token"

    message.setHeader("Content-Type", "application/json")
    // message.setHeader("Accept", "application/vnd.github+json")
    // message.setHeader("Authorization", authorization)
    message.setHeader("PRIVATE-TOKEN", token)

    //Body parameters
    def body = message.getBody(String)
    def base64Content = body.replaceAll("\\r|\\n", "")

    def msg = prop.get("GITLAB_COMMIT_MESSAGE").toString()
    def version = prop.get("Version").toString()
    def commitMessage = msg + " - Version $version"
    // def blobSHA = prop.get("content").toString()

    def jsonOutput = JsonOutput.toJson([
            "branch": "main",
            "encoding": "base64",
            commit_message: commitMessage,
            content: base64Content,
            // sha: blobSHA
    ])

    def folderName      = prop.get("GITLAB_FOLDER");
    def id              = prop.get("Id");
    def fileName        = map.get("CamelFileNameOnly");
    def UnZip           = prop.get("UNZIP");
    def Zip             = prop.get("ZIP");   
    
    if (UnZip == 'YES') {
        def value4UnZip                 = folderName + "/UnZip/" + id + "/" + fileName;
        String encodedUrlForUnZip       = URLEncoder.encode(value4UnZip, "UTF-8");
        String encodedUrlForUnZipV2     = URLEncoder.encode(encodedUrlForUnZip, "UTF-8");
        message.setProperty("encodedUrlPath", encodedUrlForUnZip)
    }
    else if(Zip == 'YES') {
        def value4Zip               = folderName + "/Zip/" + id;
        String encodedUrlForZip     = URLEncoder.encode(value4Zip, "UTF-8");
        String encodedUrlForZipV2   = URLEncoder.encode(encodedUrlForZip, "UTF-8");
        message.setProperty("encodedUrlPath", encodedUrlForZip)
    }
    
    println JsonOutput.prettyPrint(jsonOutput)
    message.setBody(JsonOutput.prettyPrint(jsonOutput))
    return message
}

def Message getFileContents(Message message) {
    //Headers
    def map = message.getHeaders()
    //Properties
    def prop = message.getProperties()
    def token = prop.get("GITLAB_ACCESS_TOKEN").toString()
    // def authorization = "Bearer $token"

    message.setHeader("Content-Type", "application/json")
    // message.setHeader("Accept", "application/vnd.github+json")
    // message.setHeader("Authorization", authorization)
    message.setHeader("PRIVATE-TOKEN", token)
    
    def folderName      = prop.get("GITLAB_FOLDER");
    def id              = prop.get("Id");
    def fileName        = map.get("CamelFileNameOnly");
    def UnZip           = prop.get("UNZIP");
    def Zip             = prop.get("ZIP");   
    
    if (UnZip == 'YES') {
        def value4UnZip                 = folderName + "/UnZip/" + id + "/" + fileName;
        String encodedUrlForUnZip       = URLEncoder.encode(value4UnZip, "UTF-8");
        String encodedUrlForUnZipV2     = URLEncoder.encode(encodedUrlForUnZip, "UTF-8");
        message.setProperty("encodedUrlPath", encodedUrlForUnZip)
    }
    else if(Zip == 'YES') {
        def value4Zip               = folderName + "/Zip/" + id;
        String encodedUrlForZip     = URLEncoder.encode(value4Zip, "UTF-8");
        String encodedUrlForZipV2   = URLEncoder.encode(encodedUrlForZip, "UTF-8");
        message.setProperty("encodedUrlPath", encodedUrlForZip)
    }

    def body = message.getBody(String)
    return message
}

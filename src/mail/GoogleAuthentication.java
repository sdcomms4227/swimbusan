package mail;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("itwill4227", "dkdl12!@");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}

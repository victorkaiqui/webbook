import br.com.webbook.*
import org.apache.commons.mail.SimpleEmail
class MailService {

    boolean transactional = false
    // Inclui as configurações do serviço no próprio serviço apenas por comodidade para este post
    String host= "smtp.gmail.com"
    String username = "victor kaiquy"
    String password = "30248429"
    String from = "kaiquy13@gmail.com"
    Integer port = 465

    def send(String subject, String msg, String to) {

        //SimpleEmail é a nossa classe heróica
        SimpleEmail email = new SimpleEmail()
        email.setHostName(host)
        email.addTo(to)
        email.setFrom(from)
        email.setSubject(subject)
        email.setMsg(msg)

        //Precisando de autenticação, ESTE é o método
        email.setAuthentication(username,password)

        // Caso precise definir a porta do seu servidor smtp
        email.setSmtpPort(port)

        // e isto faz todo o trabalho pra você :)
        email.send()
    }
}

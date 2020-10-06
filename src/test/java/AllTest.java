import com.clizo.model.QuestionsModel;
import com.clizo.model.QuestionsPOJO;
import com.poiji.bind.Poiji;
import org.junit.Test;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

public class AllTest {

    @Test
    public void testTimeConversion(){
        int millis = 416000;
        TimeZone tz = TimeZone.getTimeZone("UTC");
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        df.setTimeZone(tz);
        String time = df.format(new Date(millis));
        System.out.println(time);
    }

    /*@Test
    public void testEXcelConversion(){

        List<QuestionsModel> questions = Poiji.fromExcel(new File("/Users/leovarghese/Desktop/Project/FromSunil/294/pathTDS/sample.xls"), QuestionsModel.class);

    }*/
}

package test;

import bean.Employee;
import bean.Msg;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","classpath*:spring-mvc.xml"})
public class MvcTest {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;
    @Before
    public void intiMockMvc(){
       mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void testPage() throws Exception{
        MvcResult mvcResult =mockMvc.perform(
                MockMvcRequestBuilders.get("/emps").param("pn","2")).andReturn();
        MockHttpServletRequest request=mvcResult.getRequest();
        PageInfo pageInfo= (PageInfo)request.getAttribute("pageInfo");
        System.out.println(pageInfo.getPageNum());
        List<Employee> list=pageInfo.getList();
        for (Employee employee:list
             ) {
            System.out.println(employee.getEmpName());
        }
    }
@Test
    public void testEmp()  throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.post("/emp")).andReturn();
        MockHttpServletRequest request=mvcResult.getRequest();
        Msg msg=(Msg)request.getAttribute("");
        System.out.println(msg.getMessage());
    }
}

package controller;

import bean.Employee;
import bean.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import service.EmployeeService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
* 处理员工crud请求
* */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/emps")
    /*
    * ResponseBody 要能正常使用，需要导入jackson包
    * */
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        /*startPage后面紧跟的查询就是一个分页查询
        * */
        List<Employee> emps= employeeService.getAll();
        PageInfo pageInfo=new PageInfo(emps,6);
        return Msg.success().add("pageInfo",pageInfo);

    }
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map=new HashMap<String, Object>();
           List<FieldError> errors= result.getFieldErrors();
            for (FieldError error:errors
                 ) {
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }else {
            employeeService.saveEmp(employee);
            return  Msg.success();
        }



}
            @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
            @ResponseBody
            public Msg getEmp(@PathVariable Integer id){
                    Employee employee=employeeService.getEmp(id);
                    return Msg.success().add("emp",employee);
            }
    /*
    * 查询员工数据
    * */
   // @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        /*
        * 引入pageHelper分页插件
        * 在查询之前只需要调用
        * */
        PageHelper.startPage(pn,5);
        /*startPage后面紧跟的查询就是一个分页查询
        * */
       List<Employee> emps= employeeService.getAll();
        PageInfo pageInfo=new PageInfo(emps,6);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){
        String regs="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regs)){
            return Msg.fail().add("va_msg","用户名必须6-16位");
        }
        boolean b=employeeService.checkUser(empName);
        if(b) return Msg.success();
        else return Msg.fail().add("va_msg","用户名不可用");
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value ="/emp/{empId}",method = RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("empId") String ids){
        List<Integer> del_ids=new ArrayList<Integer>();
        if(ids.contains("-")){
            String[] str_ids= ids.split("-");

            for (String s:str_ids
                 ) {
                del_ids.add(Integer.parseInt(s));
            }
                employeeService.deleteBatchs(del_ids);

        }else {
            Integer id=Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }

        return Msg.success().add("msg","删除成功");
    }
}

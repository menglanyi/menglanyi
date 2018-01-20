package controller;

import bean.Department;
import bean.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.DeptService;

import java.util.List;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;
    /*
     *返回所有部门的信息
     *  */
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
    List<Department> list= deptService.getDepts();
        return  Msg.success().add("depts",list);
    }
}

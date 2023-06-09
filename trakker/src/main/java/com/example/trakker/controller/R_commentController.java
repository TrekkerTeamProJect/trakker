package com.example.trakker.controller;

import com.example.trakker.model.review.dto.R_commentDTO;
import com.example.trakker.service.review.R_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
public class R_commentController {

    @Autowired
    private R_commentService rcommentService;

    @PostMapping("/comment/insert")
    public void insert(R_commentDTO dto, HttpSession session) {
        long mem_num = (long) session.getAttribute("mem_num");
        dto.setMem_num(mem_num);

        rcommentService.insert(dto);

    }

    @GetMapping("/comment/list")
    public ModelAndView list(R_commentDTO dto, ModelAndView mav) {
        List<R_commentDTO> list = rcommentService.commentList(dto);
        mav.setViewName("/review/commentList");
        mav.addObject("list", list);
        return mav;
    }

    @PostMapping("/comment/edit")
    public void update(long comment_num, String editContent) {
        rcommentService.update(comment_num, editContent);
    }

    @PostMapping("/comment/delete")
    public long delete(long comment_num) {
        return rcommentService.delete(comment_num);
    }

    @PostMapping("/comment/addInsert")
    public void insert(long mem_num, long review_num, long comment_num, Integer lnum, String addContent) {

        rcommentService.addInsert(mem_num, review_num, comment_num, lnum, addContent);

    }

}

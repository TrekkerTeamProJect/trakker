package com.example.trakker.model.review.dao;

import com.example.trakker.model.review.dto.R_commentDTO;

import java.util.List;

public interface R_commentDAO {
    List<R_commentDTO> commentList(R_commentDTO dto);

    void insert(R_commentDTO dto);

    void update(long comment_num, String editContent);

    long delete(long comment_num);

    void addInsert(long mem_num, long review_num, long comment_num, Integer lnum, String addContent);
}

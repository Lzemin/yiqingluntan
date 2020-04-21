package com.ruixin.controller;

import com.ruixin.bean.Comment;
import com.ruixin.bean.Comments;
import com.ruixin.service.CommentService;
import com.ruixin.service.CommentsService;
import com.ruixin.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private CommentsService commentsService;

    @PostMapping("/comment/add")
    @ResponseBody
    public String CommentAdd(@RequestParam("container")String container,@RequestParam("newsid") String newsId){
        Comment comment = new Comment();
        comment.setContent(container);
        comment.setNewsId(Integer.parseInt(newsId));
        comment.setStatus("0");
        commentService.save(comment);
        return "success";
    }

    @PostMapping("/comments/add")
    @ResponseBody
    public String CommentsAdd(@RequestParam("container")String container,@RequestParam("commentid") String commentid){
        Comments comments = new Comments();
        comments.setContents(container);
        comments.setCommentsId(Integer.parseInt(commentid));
        comments.setCreate_by(UserUtils.getUser().getId());
        commentsService.save(comments);
        return "success";
    }
}

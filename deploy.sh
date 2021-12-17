#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t meme 
# if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
#msg="rebuilding site `date`"
#msg="发布:《浅笑无痕》"
#msg="添加:分类页添加文章统计"
msg="更新:更新测试"
#msg="修改:文章错别字"
#msg="删除:"
#msg="优化:"
#echo "请添加注释"
#read msg
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..
# 使用官方Node.js运行时作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json（如果存在）
COPY package*.json ./

# 安装依赖
RUN npm ci --only=production

# 复制应用源代码
COPY . .

# 创建.env文件（如果不存在）
RUN cp .env.example .env 2>/dev/null || touch .env

# 暴露端口（虽然此应用不直接监听端口，但保留以备将来使用）
EXPOSE 3000

# 启动应用
CMD ["npm", "start"]
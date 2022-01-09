#!/usr/bin/env bash

git clone https://hub.fastgit.org/tossp/redpill-tool-chain
cd redpill-tool-chain

sed -i 's/github.com/hub.fastgit.org/g' global_config.json
sed -i 's/github.com/hub.fastgit.org/g' docker/Dockerfile

# Step1. 918+ 配置文件，PID，VID，Mac
cat > apollolake_user_config.json << EOF
{
  "extra_cmdline": {
    "vid": "0x88AA",
    "pid": "0x88AA",
    "sn": "1750PDN196400",
    "mac1": "0011327B0CE5",
    "mac2": "0011327B0CE6"
  },
  "synoinfo": {},
  "ramdisk_copy": {},
  "extensions": []
}
EOF

# Step2. 添加驱动（可选）

# Step3. 构建工具链镜像
# sudo apt install jq
./redpill_tool_chain.sh build apollolake-7.0-41890

# Step4. 引导
./redpill_tool_chain.sh auto apollolake-7.0-41890

# Step5. 清理构建
#./redpill_tool_chain.sh clean apollolake-7.0-41890

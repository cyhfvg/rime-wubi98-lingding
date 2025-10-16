-- author: cyhfvg
-- date: 2025/10/16
--
-- lua_segmentor：根据开关给“当前可编码段”添加/移除 ext 标签
--
-- 使用时在segmentation段落的 abc_segmentor后，punct_segmentor前导入
--
-- engine:
--   segmentors:
--     - abc_segmentor
--     - lua_segmentor@gate_extra_dict
--     - punct_segmentor
function gate_extra_dict(segmentation, env)
  local on = env.engine.context:get_option("extra_dict")

  -- debug 开关
  local debug_flag = false

  if debug_flag then
    log.error(string.format("[ext_gate] option:extra_dict=%s", tostring(on)))
  end

  -- 没有任何段就返回
  if segmentation:empty() then return true end

  -- 只处理队尾这个正在输入的段
  local seg = segmentation:back()

  -- 只在普通编码段（abc）上动手：Rime 默认把普通可编码段打上 abc 标签
  if seg:has_tag("abc") then
    if on then
      -- option开启时：为该段打上 ext 标签
      seg.tags = seg.tags + Set{"ext"}

      if debug_flag then
        log.error(string.format("[ext_gate] add tag: ext"))
      end
    else
      -- option关闭时：确保移除 ext 标签
      seg.tags = seg.tags - Set{"ext"}

      if debug_flag then
        log.error(string.format("[ext_gate] remove tag: ext"))
      end
    end
  end

  return true
end

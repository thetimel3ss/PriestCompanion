-- Shared Vanilla-compatible gating for module options. The master stays usable.
local UI = PriestCompanion.UI

function UI.SetModuleOptionsEnabled(content, master, enabled)
    local children = { content:GetChildren() }
    local i
    for i = 1, table.getn(children) do
        local control = children[i]
        if control ~= master and control ~= master.optionHitBox then
            local kind = control:GetObjectType()
            if kind == "EditBox" then
                if not enabled and control:HasFocus() then
                    control:ClearFocus()
                end
                control:EnableMouse(enabled)
                control:EnableKeyboard(enabled)
            elseif kind == "Slider" then
                control:EnableMouse(enabled)
            elseif kind == "Button" or kind == "CheckButton" then
                if enabled then control:Enable() else control:Disable() end
            end
            control:SetAlpha(enabled and 1 or 0.5)
            if control.optionCaption then
                control.optionCaption:SetTextColor(
                    enabled and 1 or 0.55,
                    enabled and 1 or 0.55,
                    enabled and 1 or 0.55
                )
            end
        end
    end
end

if not settings.data.noheat then return end

-- SOURCE: https://www.unknowncheats.me/forum/payday-2/126242-never-any-job-heat-v2.html
-------------------------------------
------- NEVER ANY HEAT v2.5 ---------
--- By: hejoro Updated By: hejoro ---
------- Random Colors: spenz --------
-------------------------------------
function JobManager:heat_to_experience_multiplier(heat)
		return 1.15 --default maximum multiplier is 115%
end

--Additional insurance, so to speak
function JobManager:_check_add_heat_to_jobs(debug_job_id, ignore_debug_prints)
		if not self._global.heat then
				self:_setup_job_heat()
		end
		for job_id, _ in pairs(self._global.heat) do
				self:_change_job_heat(job_id, 500)
		end
end

--HEAT COLOR AND INTENSITY
function JobManager:get_job_heat(job_id) return math.random(25,100) end

function JobManager:get_job_heat_color(job_id)
	-- return tweak_data.screen_colors.heat_warm_color --default bonus color
	local function generate_key_list(t)
		local keys = {}
			for k, v in pairs(t) do
				keys[#keys+1] = k
			end
		return keys
	end
	
	local Colorkey = generate_key_list(Color)
	table.sort(Colorkey)
	return Color[Colorkey[math.random(1,127)]]
end
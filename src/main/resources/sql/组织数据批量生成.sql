-- 清理数据
-- delete  from taorg where idpath like 'fd811ab9c30440088df3e29ea784460a/120950e59b184fe3b9cc5ef9abd59924/%';
-- 生成数据
select TaOrgDataGenerateFunction('120950e59b184fe3b9cc5ef9abd59924','fd811ab9c30440088df3e29ea784460a/120950e59b184fe3b9cc5ef9abd59924','民政部/批量测试组织（求保护）','10',2,50);


-- 函数体
-- parentId 上级id
-- idPath 上级idPath
-- namePath 上级namePath
-- idbase id前缀
-- deep 深度(层级)
-- wide 广度(同一层级个数)
CREATE OR REPLACE FUNCTION TaOrgDataGenerateFunction (parentId VARCHAR,idPath VARCHAR,namePath VARCHAR, idbase VARCHAR, deep INTEGER,wide INTEGER)
RETURNS varchar AS $$
declare
    resultMessage varchar := '执行完成';
		nameTemplate varchar := '组织测试';

		deeptmp INTEGER := 0;
		widetmp INTEGER := 0;
		idtmp varchar := '';
		nametmp varchar := '';
		idpathtmp varchar := '';
		namepathtmp varchar := '';
BEGIN
	 deeptmp := deep - 1;
	 while widetmp < wide LOOP
	 select idbase || repeat('0', length(wide||'')-length(widetmp||'')) || widetmp into idtmp;
	 select nameTemplate || idtmp into nametmp;
	 select idPath || '/' || idtmp  into idpathtmp;
	 select namePath || '/' || nametmp  into namepathtmp;

	 INSERT INTO "public"."taorg"("orgid", "orgname", "spell", "parentid", "idpath", "namepath", "customno", "orderno", "orglevel", "area", "effective", "orgtype", "createuser", "createtime", "modifytime", "orgmanager", "orgcode", "contacts", "address", "tel", "destory", "field01", "field02", "field03", "field04", "field05", "field06", "field07", "field08", "field09", "field10") VALUES (idtmp, nametmp, '', parentId, idpathtmp, namepathtmp, '', 0, 0, null, '1', '02', '1', NULL, '2019-02-27', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


	 IF (deeptmp >= 1) THEN
	 PERFORM TaOrgDataGenerateFunction(idtmp,idpathtmp,namepathtmp,idtmp,deeptmp,wide);
	 END IF;
	 widetmp := widetmp + 1;
	 END LOOP;
   resultMessage := '执行成功';
   RETURN resultMessage;
END;
$$ LANGUAGE plpgsql;

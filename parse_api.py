from string import Template
from ruamel.yaml import YAML

module = Template("---@meta $classname\n---TODO\n---@class $classname")


urlspec_template = Template(
    "---\n---***\n---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator$relpath)\n---"
)

func_template = Template("$commentspec\n$paramspec\n---@return $returntype\n$urlspec\nfunction $className.$funName($paramList) end")

def make_Objects(obj_dict):
    """
    Generates Lua functions for the given object dictionary.

    Args:
        obj_dict (dict): The dictionary containing object information.

    Returns:
        None
    """
    funcspec = list()
    for fun in obj_dict["functions"]:
        paramspec = []
        param_names = []
        if isinstance(fun, list):
            funcspec.append(f"---{fun[2]}\n---@return {fun[1]}\nfunction Object.{fun[0]}() end")
            continue
        for k, v in fun.items():
            fun_name, ret_type, comment, link = k
            if not (isinstance(v, list) and all(map(lambda x: isinstance(x, list), v))):
                paramspec.append(f"---TODO: {v}")
            else:
                for param in v:
                    paramspec.append(f"---@param {param[0]} {param[1]}")
                    param_names.append(param[0])
        else:
            "\n".join(paramspec)
            funcspec.append(
                func_template.substitute(
                    commentspec="---" + comment,
                    funName = fun_name,
                    returntype = ret_type,
                    urlspec=urlspec_template.substitute(relpath=link),
                    paramList = ", ".join(param_names),
                    className="Object",
                    paramspec = "\n".join(paramspec)
                )
            )
    with open("Object.lua", "w") as outFile:
        outFile.write("\n\n".join(funcspec))


def main():
    """
    Main function that parses the API YAML file and generates Lua functions.

    Returns:
        None
    """
    with open("api.yaml", "r") as inFile:
        api = YAML(typ="safe").load(inFile)
    make_Objects(api["Object"])


if __name__ == "__main__":
    main()
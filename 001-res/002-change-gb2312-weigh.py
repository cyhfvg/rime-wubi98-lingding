#!/usr/bin/env python3
from colorama import Fore, Style
from pathlib import Path
from typing import Union
import argparse
import traceback

"""
脚本更改GB2312汉字表6763个汉字的 权重为 10010
python ./002-change-gb2312-weigh.py -i wubi98_dz.dict.yaml  -o abc.yaml -g GB2312汉字表_6763.txt
"""


def debug_print(level: str, msg: str) -> str:
    result_msg = ""
    prompt = ""
    if level.upper() == "error".upper():
        prompt: str = f"{Fore.RED}[ERROR]{Style.RESET_ALL}"
    elif level.upper() == "debug".upper():
        prompt: str = f"{Fore.YELLOW}[DEBUG]{Style.RESET_ALL}"
    elif level.upper() == "info".upper():
        prompt: str = f"{Fore.BLUE}[INFO]{Style.RESET_ALL}"
    elif level.upper() == "success".upper():
        prompt: str = f"{Fore.GREEN}[+]{Style.RESET_ALL}"
    elif level.upper() == "failure".upper():
        prompt: str = f"{Fore.BLUE}[-]{Style.RESET_ALL}"

    result_msg: str = "{:>20}: {}".format(prompt, msg)
    print(result_msg)
    return result_msg


def do_read_dict(dict_path: Union[Path, str], gb2312_dict: dict) -> list:
    dict_path = Path(dict_path)
    debug_print("debug", f"{dict_path}")
    result_list = []
    try:
        lines = []
        with open(dict_path, 'r', encoding='utf-8') as dict_file:
            lines = dict_file.readlines()

        lines = [line.strip() for line in lines]

        for line in lines:
            if line == '' or '\t' not in line:
                result_list.append(line)
                continue

            split_line = line.split('\t')
            character = split_line[0]
            code = split_line[1]
            weight  = split_line[2]
            if character not in gb2312_dict:
                result_list.append(line)
                continue
            else:
                weight = gb2312_dict.get(character, 10010)
                target_line = f'{character}\t{code}\t{weight}'
                result_list.append(target_line)

    except Exception as why:
        traceback.print_exc()

    return result_list


def do_read_gb2312(dict_path: Union[Path, str]) -> dict[str, int]:
    dict_path = Path(dict_path)
    result = dict()
    try:
        lines = []
        with open(dict_path, 'r', encoding='utf-8') as dict_file:
            lines = dict_file.readlines()
        lines = [ line.strip() for line in lines if line.find(r'''###''') == -1 ]
        lines = [ line for line in lines if line != '' ]

        for line in lines:
            result[line] = 10010

    except Exception as why:
        traceback.print_exc()
    return result

def do_output_result(output_path: Union[Path, str], output_list: list) -> None:
    output_path = Path(output_path)
    debug_print("debug", f"{output_path}")

    with open(output_path, 'w', encoding='utf-8') as output_file:
        for line in output_list:
            output_file.write(f'{line}\n')


def main():
    parser = argparse.ArgumentParser(description=f"此脚本可以将98至善")
    parser.add_argument('-i', '--input-dict-yaml',required=True , help="输入: 98码表-单字")
    parser.add_argument('-g', '--gb2312-path',required=True, help="输入: GB2312-字表")
    parser.add_argument('-o', '--output-dict-yaml',required=True, help="输出: 98码表-单字")

    args = parser.parse_args()


    l_input_dict_yaml = args.input_dict_yaml
    l_output_dict_yaml = args.output_dict_yaml
    l_gb2312_dict_path = args.gb2312_path

    debug_print("info", f"读取字典路径 {Fore.YELLOW}{l_input_dict_yaml}{Style.RESET_ALL}")
    debug_print("info", f"读取GB2312路径 {Fore.YELLOW}{l_gb2312_dict_path}{Style.RESET_ALL}")
    debug_print("info", f"写入字典路径 {Fore.YELLOW}{l_output_dict_yaml}{Style.RESET_ALL}")

    l_gb2312_dict = do_read_gb2312(l_gb2312_dict_path)
    l_result_list = do_read_dict(l_input_dict_yaml, l_gb2312_dict)

    do_output_result(l_output_dict_yaml, l_result_list)



if __name__ == "__main__":
    main()
